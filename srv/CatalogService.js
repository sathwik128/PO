// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function () {

//     const { EmployeeSet, POs } = this.entities;

//     this.before('UPDATE', EmployeeSet, req => {

//         if (parseFloat(req.data.salaryAmount) > 1000000) {
//             req.error(500, "Salary must be less than 1000000");
//         }

//     });

//     this.on('boost', async req => {

//         const ID = req.params[0].ID;

//         const tx = cds.transaction(req);

//         await tx.run(
//             UPDATE(POs)
//                 .set({
//                     GROSS_AMOUNT: { '+=': 500 },
//                     NOTE: 'Boosted!!'
//                 })
//                 .where({ ID })
//         );

//         const updatedPO = await tx.run(
//             SELECT.one.from(POs).where({ ID })
//         );

//         return updatedPO;

//     });

//     this.on('largestOrder', async req => {

//         const tx = cds.transaction(req);

//         return await tx.run(
//             SELECT.from(POs)
//                 .orderBy('GROSS_AMOUNT desc')
//                 .limit(1)
//         );

//     });

// });




// module.exports = cds.service.impl(async function () {

//     //step1 : get the object of our odata entities
//     const { EmployeeSet, POs } = this.entities;

//     //step2 : define generic handlers function
//     this.before('UPDATE', EmployeeSet, (req, res) => {
//         console.log("output: " + req.data.salaryAmount);
//         if (parseFloat(req.data.salaryAmount) > 1000000) {
//             req.error(500, "salary must be less than million for employee");
//         }
//     });

//     this.on('boost', async (req, res) => {
//         try {
//             const ID = req.params[0].ID;
//             console.log("Hey, your PO with ID: ", req.params[0].ID + " will be boosted")
//             const tx = cds.tx(req);
//             await tx.update(POs).with({
//                 GROSS_AMOUNT: { '+=': 15000 },
//                 NOTE: 'boosted!!'
//             }).where({ID: ID})
//         } catch (error) {
//             return "error" + error.toString();
//         }
//     });



//     this.on('largestOrder', async (req) => {
//         try {
//             const tx = cds.tx(req);

//             // select top 1 row ordered by highest gross amount
//             const reply = await tx.read(POs)
//                 .orderBy({ GROSS_AMOUNT: 'desc' })
//                 .limit(1);

//             return reply;

//         } catch (error) {
//             return "error: " + error.toString();
//         }
//     });

// });


const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    // Step 1: Get the object references of our OData entities
    const { EmployeeSet, POs } = this.entities;

    // Step 2: Before UPDATE validation for EmployeeSet
    this.before('UPDATE', EmployeeSet, (req) => {

        console.log("Salary: " + req.data.salaryAmount);

        if (parseFloat(req.data.salaryAmount) > 1000000) {
            req.error(500, "Salary must be less than 1000000 for employee");
        }

    });

    // Step 3: Boost action for Purchase Order
    this.on('boost', async (req) => {

        try {

            // Get the ID of the selected PO
            const ID = req.params[0].ID;

            console.log(
                "Hey, your PO with ID: " + ID + " will be boosted"
            );

            // Create transaction
            const tx = cds.tx(req);

            // Update the PO
            await tx.run(
                UPDATE(POs)
                    .set({
                        GROSS_AMOUNT: { '+=': 500 },
                        NOTE: 'Boosted!!'
                    })
                    .where({ ID })
            );

            // Read the updated PO
            const updatedPO = await tx.run(
                SELECT.one
                    .from(POs)
                    .where({ ID })
            );

            // Return updated PO
            return updatedPO;

        } catch (error) {

            return "error: " + error.toString();

        }

    });

    // Step 4: Find the PO with the largest gross amount
    this.on('largestOrder', async (req) => {

        try {

            // Create transaction
            const tx = cds.tx(req);

            // Select the PO having the highest GROSS_AMOUNT
            const reply = await tx.run(
                SELECT
                    .from(POs)
                    .orderBy('GROSS_AMOUNT desc')
                    .limit(1)
            );

            // Return the largest PO
            return reply;

        } catch (error) {

            return "error: " + error.toString();

        }

    });

});