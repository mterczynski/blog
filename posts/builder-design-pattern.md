---
title: "4 ways to create class instances in TypeScript"
date: 2024-02-28
---

TypeScript gives you several ways to create class instances. The choice is usually a tradeoff between brevity, readability, and flexibility.

In this article, I'll compare four common approaches:

1. a regular constructor
2. a constructor with parameter properties
3. a constructor that accepts a single object
4. the builder pattern

My main point is simple: in most TypeScript code, the builder pattern is unnecessary overhead. A constructor that accepts a single object usually gives you most of the readability benefits with less code and better type support.

## 1. Regular constructor

Let's start with a basic class:

```typescript
// 1st example: regular constructor
class Car {
  private color: string;
  private weight: number;
  private price: number;
  private brand: string;
  private productionYear: number;

  constructor(
    weight: number,
    price: number,
    brand: string,
    productionYear: number,
    color: string = "red"
  ) {
    this.weight = weight;
    this.price = price;
    this.brand = brand;
    this.productionYear = productionYear;
    this.color = color;
  }

  public getWeight() {
    return this.weight;
  }

  public getPrice() {
    return this.price;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
  }

  public getColor() {
    return this.color;
  }
}

const car = new Car(2_000, 50_000, "Ford", 2013);
```

This is the most explicit version. Everything is easy to understand, but the class is a bit verbose given how simple it is.

## 2. Constructor with parameter properties

We can make the class shorter by using [parameter properties](https://www.typescriptlang.org/docs/handbook/2/classes.html#parameter-properties).

```typescript
// 2nd example: constructor with parameter properties
class Car {
  constructor(
    private weight: number,
    private price: number,
    private brand: string,
    private productionYear: number,
    private color: string = "red"
  ) {}

  public getWeight() {
    return this.weight;
  }

  public getPrice() {
    return this.price;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
  }

  public getColor() {
    return this.color;
  }
}

const car = new Car(2_000, 50_000, "Ford", 2013);
```

This is usually a better version of the first approach. It keeps the same constructor API while removing a lot of boilerplate inside the class.

The downside is still the same: once the constructor grows, a long list of positional arguments becomes harder to read.

## 3. Constructor with a single object

When a constructor has many parameters, especially optional ones, passing a single object is often the cleanest solution.

```typescript
// 3rd example: constructor with a single object parameter
class Car {
  private color: string;
  private weight: number;
  private price: number;
  private brand: string;
  private productionYear: number;

  constructor({
    color = "red",
    weight,
    price,
    brand,
    productionYear,
  }: {
    color?: string;
    weight: number;
    price: number;
    brand: string;
    productionYear: number;
  }) {
    this.color = color;
    this.weight = weight;
    this.price = price;
    this.brand = brand;
    this.productionYear = productionYear;
  }

  public getWeight() {
    return this.weight;
  }

  public getPrice() {
    return this.price;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
  }

  public getColor() {
    return this.color;
  }
}

const car = new Car({
  weight: 2_000,
  price: 50_000,
  brand: "Ford",
  productionYear: 2013,
});
```

This version is longer again, but the call site is much more readable.

We can also provide the properties in any order:

```typescript
// this also works:
const car = new Car({
  brand: "Ford",
  weight: 2_000,
  productionYear: 2013,
  price: 50_000,
});
```

This is usually my preferred approach when a class needs multiple parameters. It keeps the code explicit, reads well at the call site, and works naturally with TypeScript's type system.

## 4. Builder pattern

Now let's look at the builder pattern.

In Java, builders are often used to avoid long constructors and to improve readability. In TypeScript, they can still work, but they are often not worth the extra code.

```typescript
// 4th example: builder pattern
class CarBuilder {
  private color?: string;
  private weight?: number;
  private price?: number;
  private brand?: string;
  private productionYear?: number;

  public setColor(color: string) {
    this.color = color;
    return this;
  }

  public setWeight(weight: number) {
    this.weight = weight;
    return this;
  }

  public setPrice(price: number) {
    this.price = price;
    return this;
  }

  public setBrand(brand: string) {
    this.brand = brand;
    return this;
  }

  public setProductionYear(productionYear: number) {
    this.productionYear = productionYear;
    return this;
  }

  public build() {
    if (this.weight === undefined)
      throw new Error("The weight parameter is required");
    if (this.price === undefined)
      throw new Error("The price parameter is required");
    if (this.brand === undefined)
      throw new Error("The brand parameter is required");
    if (this.productionYear === undefined)
      throw new Error("The productionYear parameter is required");

    return new Car(
      this.weight,
      this.price,
      this.brand,
      this.productionYear,
      this.color
    );
  }
}

// the same class from the 2nd example:
class Car {
  constructor(
    private weight: number,
    private price: number,
    private brand: string,
    private productionYear: number,
    private color: string = "red"
  ) {}

  public getWeight() {
    return this.weight;
  }

  public getPrice() {
    return this.price;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
  }

  public getColor() {
    return this.color;
  }
}

const carBuilder = new CarBuilder();
const car = carBuilder
  .setWeight(2_000)
  .setBrand("Ford")
  .setPrice(50_000)
  .setProductionYear(2013)
  .build();

console.log(car.getColor()); // red
```

The builder version is readable, but it comes with a cost:

- you need an extra class
- you duplicate the shape of the constructed object
- you often move required-field checks to runtime
- you add more code to maintain without gaining much over the single-object constructor

Method chaining is pleasant to read, but that alone is not a strong reason to introduce a builder.

## Which approach would I pick?

For most TypeScript code, my rule of thumb is simple:

- If the class has only a few parameters, use a regular constructor or parameter properties.
- If the class has many parameters or several optional fields, use a constructor that accepts a single object.
- Use a builder only when the object must be constructed step by step, or when you need a more constrained API than a plain object can provide.

## Conclusion

The builder pattern is not bad, but in TypeScript it is often unnecessary overhead.

If your class has only a few parameters, a regular constructor or parameter properties are usually enough.

If the constructor has many parameters, passing a single object is often the best option. It improves readability at the call site, lets you reorder properties freely, and works well with the type system.

That is why, in typical TypeScript code, I would usually pick approach 2 or 3 before reaching for a builder.

### Extra notes

- The `public` keyword is optional. I've added it to make the examples easier to read for developers with less TypeScript experience.
- Getters can also be created with the `get` keyword, although they are accessed a bit differently.
