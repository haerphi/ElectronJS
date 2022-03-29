import React from "react";

const ColorCube = props => {
    console.log("stuffs", props);
    return <div style={{color: props.color}}>Hello Potato</div>;
};

export default ColorCube;
