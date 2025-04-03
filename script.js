let db;

// Open or create database
function openDB() {
  let request = indexedDB.open("studentDB", 1);

  request.onerror = function(event) {
    console.log("Error opening IndexedDB.");
  };

  request.onsuccess = function(event) {
    db = event.target.result;
    console.log("Database opened successfully.");
  };

  request.onupgradeneeded = function(event) {
    var db = event.target.result;
    if (!db.objectStoreNames.contains('students')) {
      var store = db.createObjectStore('students', { keyPath: 'studentId' });
      store.createIndex('nameIndex', 'name', { unique: false });
      store.createIndex('gradeIndex', 'grade', { unique: false });
    }
  };
}

openDB();

// Add student information
document.getElementById('addForm').addEventListener('submit', function(event) {
  event.preventDefault();
  let studentId = document.getElementById('studentId').value;
  let name = document.getElementById('name').value;
  let classes = document.getElementById('classes').value;
  let course = document.getElementById('course').value;
  let grade = document.getElementById('grade').value;

  let transaction = db.transaction(['students'], 'readwrite');
  let objectStore = transaction.objectStore('students');
  objectStore.add({ studentId: studentId, name: name, classes: classes, course: course, grade: grade });

  transaction.oncomplete = function() {
    console.log("Transaction completed.");
    queryAll(); // Refresh table after adding
  };
});

// Query all student information
function queryAll() {
  let transaction = db.transaction(['students'], 'readonly');
  let objectStore = transaction.objectStore('students');
  let request = objectStore.getAll();

  request.onsuccess = function() {
    let result = request.result;
    renderTable(result);
  };
}

// Search student by ID
function searchStudent() {
  const searchId = document.getElementById('searchInput').value;
  if (!searchId) return;

  let transaction = db.transaction(['students'], 'readonly');
  let objectStore = transaction.objectStore('students');
  let request = objectStore.get(searchId);

  request.onsuccess = function() {
    const student = request.result;
    if (student) {
      renderTable([student]);
    } else {
      renderTable([]);
      alert('Student not found!');
    }
  };
}

// Render table
function renderTable(data) {
  const tbody = document.getElementById('result');
  tbody.innerHTML = '';

  data.forEach(student => {
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${student.studentId}</td>
      <td>${student.name}</td>
      <td>${student.classes}</td>
      <td>${student.course}</td>
      <td>${student.grade}</td>
      <td class="action-buttons">
        <button onclick="updateStudent('${student.studentId}', ${JSON.stringify(student)})">Edit</button>
        <button onclick="deleteStudent('${student.studentId}')">Delete</button>
      </td>
    `;
    tbody.appendChild(row);
  });
}

// Update student information
function updateStudent(id, data) {
  // Implement edit form logic here
  console.log('Update student:', id, data);
}

// Delete student information
function deleteStudent(id) {
  let transaction = db.transaction(['students'], 'readwrite');
  let objectStore = transaction.objectStore('students');
  objectStore.delete(id);

  transaction.oncomplete = function() {
    console.log("Transaction completed.");
    queryAll(); // Refresh table after deletion
  };
}
