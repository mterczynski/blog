---
layout: post
title: "Builder design pattern in TypeScript"
date: 2024-02-10 22:34:02 +0100
categories: design-patterns, typescript
---

The builder pattern allows to easily create complex objects with different configurable properties.
I'd argue that it's not the best approach to create class instances in TypeScript. I'll present a few different approaches to use classes in TypeScript and give my opinions on them.

Let's start with a basic class:

```typescript
// 1st example: basic class
class Car {
  private color: string;
  private weight: number;
  private price: number;
  private brand: number;
  private productionYear: number;

  constructor(
    weight: number,
    price: number,
    brand: string,
    productionYear: number,
    color?: string
  ) {
    this.weight = weight;
    this.price = price;
    this.brand = brand;
    this.productionYear = productionYear;
    this.color = color ?? "red";
  }

  public getColor() {
    return this.color;
  }

  public getWeight() {
    return this.weight;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
  }
}

const car = new Car(2_000, 50_000, "Ford", 2013);
```

This code is a bit lenghtly given its simplicity. Let's make it shorter using [parameter properties](https://www.typescriptlang.org/docs/handbook/2/classes.html#parameter-properties) syntax provided by TypeScript.

```typescript
// 2nd example: class with parameter properties
class Car {
  constructor(
    private weight: number,
    private price: number,
    private brand: string,
    private productionYear: number,
    private color?: string
  ) {
    this.color = this.color ?? "red";
  }

  public getColor() {
    return this.color;
  }

  public getWeight() {
    return this.weight;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
  }
}

const car = new Car(2_000, 50_000, "Ford", 2013);
```

The next problem that we have is that there are a lot of parameters in the constructor, which is hard to read. Let's fix that.

```typescript
// 3rd example: class with parameters packed into a single object
class Car {
  private color: string;
  private weight: number;
  private price: number;
  private brand: string;
  private productionYear: number;

  constructor({
    color,
    weight,
    price,
    brand,
    productionYear,
  }: {
    color: string;
    weight: number;
    price: number;
    brand: string;
    productionYear: number;
  }) {
    this.color = color ?? "red";
    this.weight = weight;
    this.price = price;
    this.brand = brand;
    this.productionYear = productionYear;
  }

  public getColor() {
    return this.color;
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
}

const car = new Car({
  weight: 2_000,
  price: 50_000,
  brand: "Ford",
  productionYear: 2013,
});
```

The code has become lengthy again, but now the code for creating a new car is very readable. We can now also provide the parameters in any order we want.

```typescript
// this also works:
const car = new Car({
  brand: "Ford",
  weight: 2_000,
  productionYear: 2013,
  price: 50_000,
});
```

Let's compare that code with one varation of the builder pattern:

```typescript
// 4th approach: builder class + class with parameter properties
class CarBuilder {
  private color: string;
  private weight: number;
  private price: number;
  private brand: string;
  private productionYear: number;

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

  public setProductionYear(productionYear: string) {
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

class Car {
  constructor(
    private weight: number,
    private price: number,
    private brand: string,
    private productionYear: number,
    private color?: string
  ) {
    this.color = this.color ?? "red";
  }

  public getColor() {
    return this.color;
  }

  public getWeight() {
    return this.weight;
  }

  public getBrand() {
    return this.brand;
  }

  public getProductionYear() {
    return this.productionYear;
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

The builder pattern typically uses method chaining which you might know from RxJS or algorithms operating on arrays.

```typescript
const client = clients
  .filter((client) => client.age >= 18)
  .sort((prev, next) => prev.name.localeCompare(next.name))
  .find((client) => client.country === "Poland");
```

`Array.prototype.filter` and `Array.prototype.sort` both return an array which allows to call array methods indefinitely.
Similarly, builder setters return `this` instance of a builder which allows to call builder setters indefinitely.

## Conclusions

The builder pattern can be useful in Java code, but it doesn't seem to be that useful in TypeScript code - it requires creating an additional class with error checking (which works only in runtime and won't give us errors in compilation time).
I recommend using approaches from 2nd or 3rd examples instead.

### Extra notes

`public` keyword is optional, I've added it to make the examples more understandable for developers with less TypeScript experience.