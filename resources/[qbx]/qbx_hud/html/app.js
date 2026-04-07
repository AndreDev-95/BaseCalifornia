const statusBars = {
  health: document.getElementById('health'),
  armor: document.getElementById('armor'),
  hunger: document.getElementById('hunger'),
  thirst: document.getElementById('thirst'),
  voice: document.getElementById('voice')
};

const wraps = {
  health: document.querySelector('[data-key="health"]'),
  armor: document.querySelector('[data-key="armor"]'),
  hunger: document.querySelector('[data-key="hunger"]'),
  thirst: document.querySelector('[data-key="thirst"]'),
  voice: document.querySelector('[data-key="voice"]')
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

function setCriticalState(id, active) {
  const wrap = wraps[id];
  if (!wrap) return;
  wrap.classList.toggle('is-critical', active);
}

function setPulse(element, active) {
  if (!element) return;
  element.classList.toggle('is-pulse', active);
}

function setBar(id, value, criticalThreshold = 20) {
  const el = statusBars[id];
  if (!el) return;
  const safe = clamp(value, 0, 100);
  el.style.width = `${safe}%`;
  el.style.opacity = safe <= 0 ? '0.35' : '1';
  const critical = safe <= criticalThreshold;
  setCriticalState(id, critical);
  setPulse(el, critical);
}

function updateVoice(voice = 0, talking = false, radio = 0) {
  const safe = clamp((Number(voice) || 0) * 20, 8, 100);
  setBar('voice', safe, 0);

  if (!voiceEl) return;

  setPulse(voiceEl, Boolean(talking || radio));

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
  setPulse(fuelEl, false);

  if (safe <= 20) {
    fuelEl.classList.add('danger');
    setPulse(fuelEl, true);
  } else if (safe <= 35) {
    fuelEl.classList.add('warning');
  } else {
    fuelEl.classList.add('success');
  }
}

function updateSeatbelt(enabled) {
  seatbeltEl.textContent = enabled ? 'CINTO ON' : 'SEM CINTO';
  seatbeltEl.className = 'pill';
  seatbeltEl.classList.add(enabled ? 'success' : 'danger');
  setPulse(seatbeltEl, !enabled);
}

function updateSpeed(speed = 0) {
  const safe = clamp(speed, 0, 999);
  speedEl.textContent = Math.round(safe);
  speedEl.classList.remove('is-fast', 'is-danger');

  if (safe >= 180) {
    speedEl.classList.add('is-danger');
  } else if (safe >= 120) {
    speedEl.classList.add('is-fast');
  }
}

window.addEventListener('message', (event) => {
  const data = event.data || {};

  if (data.action === 'hudtick') {
    const hiddenByState = data.show === false || Number(data.health) <= 0 || Number(data.isPaused) === 1;
    setVisible(hudEl, !hiddenByState);
    setBar('health', data.health, 25);
    setBar('armor', data.armor, 10);
    setBar('hunger', data.hunger, 25);
    setBar('thirst', data.thirst, 25);
    updateVoice(data.voice, data.talking, data.radio);
  }

  if (data.action === 'car') {
    const visible = Boolean(data.show) && Number(data.isPaused) !== 1;
    setVisible(vehicleEl, visible);
    updateSpeed(data.speed);
    updateFuel(data.fuel);
    updateSeatbelt(Boolean(data.seatbelt));
  }
});
