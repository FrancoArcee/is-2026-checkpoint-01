Promise.all([
  fetch('http://localhost:5000/api/health'),
  fetch('http://localhost:5000/api/team')
])
.then(([healthRes, teamRes]) => {
  if (healthRes.ok) {
    document.getElementById('status').textContent = '✅ Backend activo';
  } else {
    document.getElementById('status').textContent = '⚠️ Backend con problemas';
  }

  return teamRes.json();
})
.then(data => {
  const tbody = document.getElementById('team-table');

  data.forEach(miembro => {
    const fila = document.createElement('tr');
    fila.innerHTML = `
      <td>${miembro.nombre}</td>
      <td>${miembro.legajo}</td>
      <td>${miembro.feature}</td>
      <td>${miembro.servicio}</td>
      <td>${miembro.estado}</td>
    `;
    tbody.appendChild(fila);
  });
})
.catch(() => {
  document.getElementById('status').textContent = '❌ Backend no disponible';
});