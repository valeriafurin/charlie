const cards = document.querySelectorAll('.card')
const getHelpOpts = document.getElementById('get-help-options')

const toggleActive = (element) => {
    cards.forEach(card => card.classList.remove('active'))
    element.classList.add('active')
}

if (getHelpOpts) {
  cards.forEach(card => {
    card.addEventListener('click', (e) => {
      toggleActive(e.target)
    })
  })
}

export { toggleActive }
