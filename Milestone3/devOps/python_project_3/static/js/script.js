// Add item
document.getElementById('addForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const itemName = document.getElementById('itemName').value;
    fetch('/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name: itemName }),
    })
        .then((response) => response.json())
        .then((data) => {
            const itemList = document.getElementById('itemList');
            const li = document.createElement('li');
            li.setAttribute('data-id', data.id);
            li.innerHTML = `
                <span>${data.name}</span>
                <button onclick="editItem(${data.id})">Edit</button>
                <button onclick="deleteItem(${data.id})">Delete</button>
            `;
            itemList.appendChild(li);
            document.getElementById('itemName').value = '';
        });
});

// Edit item
function editItem(itemId) {
    const newName = prompt('Enter new name:');
    if (newName) {
        fetch(`/update/${itemId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ name: newName }),
        })
            .then((response) => response.json())
            .then((data) => {
                const item = document.querySelector(`li[data-id="${itemId}"] span`);
                item.textContent = data.name;
            });
    }
}

// Delete item
function deleteItem(itemId) {
    fetch(`/delete/${itemId}`, {
        method: 'DELETE',
    })
        .then((response) => response.json())
        .then(() => {
            const item = document.querySelector(`li[data-id="${itemId}"]`);
            item.remove();
        });
}