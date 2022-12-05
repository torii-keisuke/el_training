import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("hello, world");
  }

  static targets = ["message"];

  hide() {
    this.messageTarget.style.display = "block";
  }
}
