import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-availability"
export default class extends Controller {
  static targets = ["from", "to", "availability", "bookings"]
  static values = {
    bookings: Array
  }


  connect() {
    let index = 1
    // let date_from = Date.new

    // this.fromTarget.addEventListener("input", () => {
    //   this.#update_from_date
    // });
    this.toTarget.addEventListener("input", () => {
      const date_to = this.toTarget.value
      console.log(date_to)
      console.log(this.fromTarget.value)
      if (this.fromTarget.value){
        console.log("hi")
        const span = this.availabilityTarget.children[index]
        if (span){
          this.availabilityTarget.children[index].innerHTML = ""
          index += 1
        }
        this.insert_html(this.check_availability);

      }
    });

    //
  }
  // #update_from_date(){
  //   date_from = this.fromTarget.value
  // }

  check_availability(){
    const date_from = this.fromTarget.value
    const date_to = this.toTarget.value
    const date_from_check = date_from >= booking.date_from && date_from <= booking.date_to
    console.log(date_from_check)
    const date_to_check = date_to >= booking.date_from && date_to <= booking.date_to

    let available = true

    for (const booking of this.bookingsValue){
      if (date_from_check || date_to_check){
        available = false;
        break;
      }
    }
    return available
  }

  insert_html(available){
    const is_available = '<span style="color: green;">Available</span>'
    const not_available = '<span style="color: red;">Unavailable</span>'
    if (available){
      this.availabilityTarget.insertAdjacentHTML('beforeend', is_available)
      console.log("Hello")
    }else{
      this.availabilityTarget.insertAdjacentHTML('beforeend', not_available)
      console.log("Bye")
    }
  }

}
