$(function() {
	var tags = $('.tags'),
		len = tags.length,
		wraper = $('.sidebar-bottom'),
		tagsArray = [],
		radius = 110,
		fallLength = 250,
		angleX = Math.PI / 300,
		angleY = Math.PI / 300,
		centerX = wraper.width() / 2,
		centerY = wraper.height() / 2,
		t;

	// tags.css('color', 'red')
	// alert(tags)
	tags.hover(function() {
		clearInterval(t);
	}, function() {
		animate();
	})

	function init() {
		for (let i = 0; i < len; i++) {
			let a, b;
			let k = (2 * (i + 1) - 1) / len - 1; //元素均匀分布
			a = Math.acos(k);
			b = a * Math.sqrt(len * Math.PI);
			let x = radius * Math.sin(a) * Math.cos(b);
			let y = radius * Math.sin(a) * Math.sin(b);
			let z = radius * Math.cos(a);
			var tag = new Tag(tags[i], x, y, z);
			tags[i].style.color = "rgb(" + parseInt(Math.random() * 255) + "," + parseInt(Math.random() * 255) + "," + parseInt(Math.random() * 255) + ")";
			tagsArray.push(tag);
			tag.move();
		}
	}

	var Tag = function(element, x, y, z) {
		this.element = element;
		this.x = x;
		this.y = y;
		this.z = z;
	}
	Tag.prototype = {
		move: function() {
			var scale = fallLength / (fallLength - this.z);
			var alpha = (this.z + radius) / (2 * radius);
			this.element.style.fontSize = 10 * scale + "px";
			this.element.style.opacity = alpha + 0.5;
			this.element.style.filter = "alpha(opacity = " + (alpha + 0.5) * 100 + ")";
			this.element.style.zIndex = parseInt(scale * 100);
			this.element.style.left = this.x + centerX - this.element.offsetWidth / 2 - 10 + "px";
			this.element.style.top = this.y + centerY - this.element.offsetHeight / 2 + 10 + "px";
		}
	}
	Array.prototype.forEach = function(callback) {
		for (var i = 0; i < this.length; i++) {
			callback.call(this[i]);
		}
	}

	function animate() {
		t = setInterval(function() {
			rotateX();
			rotateY();
			tagsArray.forEach(function() {
				this.move();
			})
		}, 80)
	}

	function rotateX() {
		var cos = Math.cos(angleX);
		var sin = Math.sin(angleX);
		tagsArray.forEach(function() {
			var y1 = this.y * cos - this.z * sin;
			var z1 = this.z * cos + this.y * sin;
			this.y = y1;
			this.z = z1;
		})

	}

	function rotateY() {
		var cos = Math.cos(angleY);
		var sin = Math.sin(angleY);
		tagsArray.forEach(function() {
			var x1 = this.x * cos - this.z * sin;
			var z1 = this.z * cos + this.x * sin;
			this.x = x1;
			this.z = z1;
		})
	}
	init();
	// setInterval(init, 1000);
	animate();
	// $(window).resize(function() {
	// 	init();
	// });
	// alert(Math.PI)
})