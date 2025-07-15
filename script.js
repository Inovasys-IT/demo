document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('todo-form');
    const input = document.getElementById('new-todo');
    const list = document.getElementById('todo-list');

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        const text = input.value.trim();
        if (text !== '') {
            addTodo(text);
            input.value = '';
        }
    });

    function addTodo(text) {
        const li = document.createElement('li');
        const span = document.createElement('span');
        span.textContent = text;
        li.appendChild(span);

        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'x';
        li.appendChild(deleteBtn);

        li.addEventListener('click', function (e) {
            if (e.target === deleteBtn) {
                list.removeChild(li);
            } else {
                li.classList.toggle('completed');
            }
        });

        list.appendChild(li);
    }
});
