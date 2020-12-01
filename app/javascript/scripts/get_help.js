const addActive = () => {

const cards = document.querySelectorAll('.card')
const getHelpOpts = document.getElementById('get-help-options')

  if (getHelpOpts) {
    const toggleActive = (element) => {
        cards.forEach(card => card.classList.remove('active'))
        element.classList.add('active')
    }

    cards.forEach(card => {
      card.addEventListener('click', (e) => {
        toggleActive(e.target)
      })
    })
  }
}

export { addActive }
