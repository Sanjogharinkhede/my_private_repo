from flask import Flask, render_template, request, redirect, url_for, jsonify

app = Flask(__name__)

# In-memory data store (replace with a database in production)
items = []

# Read all items
@app.route('/')
def index():
    return render_template('index.html', items=items)

# Create an item
@app.route('/add', methods=['POST'])
def add_item():
    data = request.json
    new_item = {
        'id': len(items) + 1,
        'name': data['name']
    }
    items.append(new_item)
    return jsonify(new_item)

# Update an item
@app.route('/update/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    data = request.json
    for item in items:
        if item['id'] == item_id:
            item['name'] = data['name']
            return jsonify(item)
    return jsonify({'error': 'Item not found'}), 404

# Delete an item
@app.route('/delete/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    global items
    items = [item for item in items if item['id'] != item_id]
    return jsonify({'message': 'Item deleted'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
