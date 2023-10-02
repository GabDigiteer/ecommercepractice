import { Controller } from "@hotwired/stimulus"
import { debounce } from "debounce"

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
    console.log("ASD")
    this.submit = debounce(this.submit.bind(this), 300);
  }

  submit() {
    console.log("Submit function called");
  }

}
