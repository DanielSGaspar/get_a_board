import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Never miss a wave", "Get a board"],
      typeSpeed: 50,
      loop: true
    })
  }
}
