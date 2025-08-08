// Mobile navigation toggle
const navToggle = document.getElementById('navToggle');
const primaryNav = document.getElementById('primaryNav');

if (navToggle && primaryNav) {
  navToggle.addEventListener('click', () => {
    const expanded = navToggle.getAttribute('aria-expanded') === 'true' || false;
    navToggle.setAttribute('aria-expanded', String(!expanded));
    primaryNav.classList.toggle('show');
  });
}

// Sticky header subtle shadow
const header = document.getElementById('siteHeader');
let last = 0;
window.addEventListener('scroll', () => {
  const y = window.scrollY || document.documentElement.scrollTop;
  if (y > 10 && last <= 10) header.style.boxShadow = '0 10px 30px -20px rgba(0,0,0,.6)';
  if (y <= 10 && last > 10) header.style.boxShadow = 'none';
  last = y;
});

// Fake submit for demo
const form = document.querySelector('.form');
if (form) {
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const btn = form.querySelector('button');
    if (btn) {
      const original = btn.textContent;
      btn.textContent = '送信しました ✓';
      btn.disabled = true;
      btn.style.opacity = '0.8';
      setTimeout(() => {
        btn.textContent = original;
        btn.disabled = false;
        btn.style.opacity = '1';
        form.reset();
      }, 2600);
    }
  })
}
