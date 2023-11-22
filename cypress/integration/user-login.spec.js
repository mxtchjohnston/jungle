describe("User Login", () => {
  it("should register a new user", () => {
    cy.visit("/signup");
    cy.get("input[id=user_first]").type("John");
    cy.get("input[id=user_last]").type("Doe");
    cy.get("input[id=user_email]").type("test@example.com");
    cy.get("input[id=user_password]").type("Password");
    cy.get("input[id=user_password_confirmation]").type("Password");
    cy.get("input[name=commit]").click();
    cy.contains("Signed in as John").should("be.visible");
    cy.get("a[href='/logout']").click();
    cy.contains("Signed in as John").should("not.exist");
  });

  it("should login a user", () => {
    cy.visit("/login");
    cy.get("input[name=email]").type("test@example.com");
    cy.get("input[name=password]").type("Password");
    cy.get("input[name=commit]").click();
    cy.contains("Signed in as John").should("be.visible");
  });
});