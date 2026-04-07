const statusBars = {
  health: document.getElementById('health'),
  armor: document.getElementById('armor'),
  hunger: document.getElementById('hunger'),
  thirst: document.getElementById('thirst'),
  voice: document.getElementById('voice')
};

const hudEl = document.getElementById('hud');
const vehicleEl = document.getElementById('vehicle');
const speedEl = document.getElementById('speed');
const fuelEl = document.getElementById('fuel');
const seatbeltEl = document.getElementById('seatbelt');
const voiceEl = document.getElementById('voice');

function clamp(value, min, max) {
  return Math.max(min, Math.min(max, Number(value) || 0));
}

function setVisible(element, visible) {
  if (!element) return;
  element.classList.toggle('hidden', !visible);
}

function setBar(id, value) {
  const el = statusBars[id];
  if (!el) return;
  const safe = clamp(value, 0, 100);
  el.style.width = `${safe}%`;
  el.style.opacity = safe <= 0 ? '0.35' : '1';
}

function updateVoice(voice = 0, talking = false, radio = 0) {
  const safe = clamp((Number(voice) || 0) * 20, 0, 100);
  setBar('voice', safe || 8);

  if (!voiceEl) return;

  if (radio && radio !== 0) {
    voiceEl.style.background = 'linear-gradient(90deg, #fb7185, #dc2626)';
  } else if (talking) {
    voiceEl.style.background = 'linear-gradient(90deg, #fde047, #f59e0b)';
  } else {
    voiceEl.style.background = 'linear-gradient(90deg, #e5e7eb, #94a3b8)';
  }
}

function updateFuel(fuel = 0) {
  const safe = clamp(fuel, 0, 100);
  fuelEl.textContent = `${Math.round(safe)}%`;
  fuelEl.className = 'pill';

  if (safe <= 20) {
    fuelEl.classList.add('warning');
  } else {
    fuelEl.classList.add('success');
  }
}

function updateSeatbelt(enabled) {
  seatbeltEl.textContent = enabled ? 'CINTO' : 'SEM CINTO';
  seatbeltEl.className = 'pill';
  seatbeltEl.classList.add(enabled ? 'success' : 'danger');
}

window.addEventListener('message', (event) => {
  const data = event.data || {};

  if (data.action === 'hudtick') {
    const visible = data.show !== false;
    setVisible(hudEl, visible);
    setBar('health', data.health);
    setBar('armor', data.armor);
    setBar('hunger', data.hunger);
    setBar('thirst', data.thirst);
    updateVoice(data.voice, data.talking, data.radio);
  }

  if (data.action === 'car') {
    const visible = Boolean(data.show);
    setVisible(vehicleEl, visible);
    speedEl.textContent = Math.round(Number(data.speed) || 0);
    updateFuel(data.fuel);
    updateSeatbelt(Boolean(data.seatbelt));
  }
});
