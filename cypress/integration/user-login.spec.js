describe('Navigation', () => {
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it('should log user in', () => {
    cy.get('[data-test-id="login-button"]').click();
    cy.get('input[name="email"]').type('bobdoe@gmail.com');
    cy.get('input[name="password"]').type('hello');
    cy.contains('Submit').click();
    cy.contains('Signed in as Bob');
  });
});
