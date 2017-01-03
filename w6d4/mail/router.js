class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    document.addEventListener("hashchange", () => this.render());

  }

  activeRoute() {
    let hash = window.location.hash.substr(1);
    let component = this.routes[hash];
    return component;
  }

  render() {
    this.node.innerHTML = "";
    let currentRoute = this.activeRoute();
    this.node.appendChild(currentRoute.render());
  }
}

module.exports = Router;
