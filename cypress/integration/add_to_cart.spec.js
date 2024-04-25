describe('ruby-jungle-app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('Should display the homepage', () => {
    cy.get('h1').should('contain', 'The Jungle')
  })

  it('There is a product on the page', () => {
    cy.get('.products article').should('be.visible')
  })

  it("There are 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it('User can click the Add  button for a product on the home page and the cart increases by one', () => {
    cy.contains('My Cart (0)')
    cy.contains('Add').first().click({force: true})
    cy.contains('My Cart (1)')
  })

})