# app.py

# Required imports
import os
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app, auth

# Initialize Flask app
app = Flask(__name__)

# Initialize Firestore DB
cred = credentials.Certificate(os.environ['PATH_TO_KEY'])
default_app = initialize_app(cred)
db = firestore.client()
users_ref = db.collection('users')

@app.route('/add', methods=['POST'])
def create():
    """
        create() : Add document to Firestore collection with request body.
        Ensure you pass a custom ID as part of json body in post request,
        e.g. json={'id': '1', 'title': 'Write a blog post'}
    """
    try:
        id = request.json['id']
        #should include id, username, password, email, and permissions
        users_ref.document(id).set(request.json)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"

@app.route('/list', methods=['GET'])
def read():
    """
        read() : Fetches documents from Firestore collection as JSON.
    """
    try:
        # Check if ID was passed to URL query
        user_id = request.args.get('id')
        username = request.args.get('username')
        if user_id is None:
            for doc in users_ref.stream():
                if doc.get('username') == username:
                    user_id = doc.id
        if user_id:
            user = users_ref.document(user_id).get()
            return jsonify(user.to_dict()), 200
        else:
            # all_users = [doc.to_dict() for doc in users_ref.stream()]
            return jsonify("No user found matching given parameters."), 200
    except Exception as e:
        return f"An Error Occurred: {e}"

@app.route('/update', methods=['POST', 'PUT'])
def update():
    """
        update() : Update document in Firestore collection with request body.
        Ensure you pass a custom ID as part of json body in post request,
        e.g. json={'id': '1', 'title': 'Write a blog post today'}
    """
    try:
        document_id = request.args.get('id')
        if document_id is None:
            username = request.args.get('username')
            for doc in users_ref.stream():
                if doc.get('username') == username:
                    document_id = doc.id
        users_ref.document(document_id).update(request.json)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"

@app.route('/delete', methods=['GET', 'DELETE'])
def delete():
    """
        delete() : Delete a document from Firestore collection.
    """
    try:
        # Check for ID in URL query
        document_id = request.args.get('id')
        if document_id is None:
            username = request.args.get('username')
            for doc in users_ref.stream():
                if doc.get('username') == username:
                    document_id = doc.id
        users_ref.document(document_id).delete()
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"

port = int(os.environ.get('PORT', 8080))
if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=port)
