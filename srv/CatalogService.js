module.exports = cds.service.impl(async function () {

    //step1 : get the object of our odata entities
    const { EmployeeSet, POs } = this.entities;

    //step2 : define generic handlers function
    this.before('UPDATE', EmployeeSet, (req, res) => {
        console.log("output: " + req.data.salaryAmount);
        if (parseFloat(req.data.salaryAmount) > 1000000) {
            req.error(500, "salary must be less than million for employee");
        }
    });

    this.on('boost', async (req, res) => {
        try {
            const ID = req.params[0].ID;
            console.log("Hey, your PO with ID: ", req.params[0].ID + " will be boosted")
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT: { '+=': 20000 },
                NOTE: 'boosted!!'
            }).where({ID: ID})
        } catch (error) {
            return "error" + error.toString();
        }
    });

    this.on('largestOrder', async (req) => {
        try {
            const tx = cds.tx(req);

            // select top 1 row ordered by highest gross amount
            const reply = await tx.read(POs)
                .orderBy({ GROSS_AMOUNT: 'desc' })
                .limit(1);

            return reply;

        } catch (error) {
            return "error: " + error.toString();
        }
    });

});