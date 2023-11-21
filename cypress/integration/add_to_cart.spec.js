describe("Add to cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is a link to the product page", () => {
    cy.contains("Scented Blade").click();
    cy.url().should("include", "/products/");
    cy.contains("Add").click();
    cy.contains("My Cart (1)");
  });
});