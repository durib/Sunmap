let basemapBaseURL = 'http://localhost:5001';

//// Initialize the map and set its view to Hobart, Tasmania with a zoom level of 13
let map = L.map('map').setView([-42.8821, 147.3272], 13);

// Add a tile layer to the map using the specified URL
let season = 'Winter';
let layers = [
    {'name':'Sunset','colormap':'cividis','stretch':{'min':14,'max':16.25}},
    {'name':'Sunrise','colormap':'blues','stretch':{'min':7.75,'max':10}},
    {'name':'Suntime','colormap':'magma','stretch':{'min':6,'max':8.5}}
];

// Create an object to hold the layer instances
let basemaps = {};

// Add each layer to the map and to the layer control as basemaps
layers.forEach(function(layer) {
    let tileLayer = L.tileLayer(`${basemapBaseURL}/singleband/${season}/${layer.name}/{z}/{x}/{y}.png?colormap=${layer.colormap}&stretch_range=[${layer.stretch.min},${layer.stretch.max}]`);
    basemaps[layer.name] = tileLayer;
});

// Add the layer control to the map with basemaps
L.control.layers(basemaps).addTo(map);

// Add the default layer to the map (optional)
basemaps['Sunset'].addTo(map);