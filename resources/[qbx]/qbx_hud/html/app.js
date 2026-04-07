const statusBars = {
  health: document.getElementById('health'),
  armor: document.getElementById('armor'),
  hunger: document.getElementById('hunger'),
  thirst: document.getElementById('thirst')
};

const speedEl = document.getElementById('speed');
const fuelEl = document.getElementById('fuel');
const hudEl = document.getElementById('hud');
const vehicleEl = document.getElementById('vehicle');

function clamp(value, min, max) {
  return Math.max(min, Math.min(max, Number(value) || 0));
}

function setBar(id, value) {
  const el = statusBars[id];
  if (!el) return;
  const safe = clamp(value, 0, 100);
  el.style.width = `${safe * 1.2}px`;
  el.dataset.value = safe;
}

function setVehicle(show, speed, fuel) {
  vehicleEl.style.display = show ? 'block' : 'none';
  speedEl.textContent = Math.round(speed || 0);
  fuelEl.textContent = `${Math.round(fuel || 0)}%`;
}

window.addEventListener('message', (event) => {
  const data = event.data || {};

  if (data.action === 'hudtick') {
    hudEl.style.display = data.show === false ? 'none' : 'block';
    setBar('health', data.health);
    setBar('armor', data.armor);
    setBar('hunger', data.hunger);
    setBar('thirst', data.thirst);
  }

  if (data.action === 'car') {
    setVehicle(Boolean(data.show), data.speed, data.fuel);
  }
});
