describe('Navigation', () => {
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it('should log user in and take to home page with name in navbar', () => {
    cy.visit('/');
    cy.get('[data-test-id="login-button"]').click();
    cy.get('input[name="email"]').type('bobdoe@gmail.com');
    cy.get('input[name="password"]').type('hello');
    cy.contains('Submit').click();
    cy.contains('Signed in as Bob');
    cy.contains('Logout').click();
  });

  it('should signup user and take to home page with name in navbar', () => {
    cy.visit('/');
    cy.get('[data-test-id="signup-button"]').click();
    cy.get('input[name="user[first_name]"').type('John');
    cy.get('input[name="user[last_name]"').type('Doe');
    cy.get('input[name="user[email]"').type('JohnDoe@gmail.com');
    cy.get('input[name="user[password]"').type('hello');
    cy.get('input[name="user[password_confirmation]"').type('hello');
    cy.contains('Submit').click();
    cy.contains('Signed in as John');
    cy.contains('Logout').click();
  });
});
