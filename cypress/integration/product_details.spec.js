describe("Product page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is a title", () => {
    cy.get("h1").should("be.visible");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("There is a link to the product page", () => {
    cy.get(".products article a").first().click();
    cy.url().should("include", "/products/");
    cy.get(".product-detail").should("be.visible");
    cy.get(".quantity").should("be.visible");
    cy.get(".price").should("be.visible");

  })
});
