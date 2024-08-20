
function xnor(a, b) {

        // Make sure a is larger
        if (a < b) {

                // swapping a and b;
                let t = a;
                a = b;
                b = t;
        }

        if (a == 0 && b == 0)
                return 1;

        // for last bit of a
        let a_rem = 0;

        // for last bit of b
        let b_rem = 0;

        // counter for count bit 
        // and set bit in xnornum
        let count = 0;

        // to make new xnor number
        let xnornum = 0;

        // for set bits in new xnor number
        while (true) {
                // get last bit of a
                a_rem = a & 1;

                // get last bit of b
                b_rem = b & 1;

                // Check if current two bits are same
                if (a_rem == b_rem)
                        xnornum |= (1 << count);

                // counter for count bit
                count++;
                a = a >> 1;
                b = b >> 1;
                if (a < 1)
                        break;
        }
        return xnornum;
}

calc = (a, b) => {
        console.log({
                "000 (+)": (a + b).toString(16),
                "001 (-)": (a - b).toString(16),
                "010 (<<)": (a << 1).toString(16).padStart(4, "0"),
                "011 (>>)": (a >> 1).toString(16).padStart(4, "0"),
                "100 (AND)": (a & b).toString(16),
                "101 (OR)": (a | b).toString(16),
                "110 (XOR)": (a ^ b).toString(16).padStart(4, "0"),
                "111 (XNOR)": xnor(a, b).toString(16),
        })
}

