describe('ruby-jungle-app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('should display the homepage', () => {
    cy.get('h1').should('contain', 'The Jungle')
  })

  it('There is a product on the page', () => {
    cy.get('.products article').should('be.visible')
  })

  it("There are 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });


  it("Should navigate to a product details page and check details", () => {
    cy.get(".products article").first().find('a').click();
    cy.get('.product-detail').should('be.visible');
    cy.get('.price').should('exist');

  
  });

  
  
})