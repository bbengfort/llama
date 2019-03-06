import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
    return (
        <div>
            <p>This is a different page!</p>
            <p><Link to="/">Go back to home</Link></p>
        </div>
    );
};