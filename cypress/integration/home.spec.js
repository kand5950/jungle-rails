describe('Navigation', () => {
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it('should show products on page', () => {
    cy.get('.products article').should('be.visible');
  });
});
