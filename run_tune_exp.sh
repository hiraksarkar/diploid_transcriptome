#for i in {5..9}; do ~/Projects/salmon/build/src/salmon index -i tune_noise_salmon_ind/salmon_ind_${i} -t LIPG_allele.0.$i.fa; done


#for i in {5..9}; do ~/Projects/salmon_sl/salmon/build/src/salmon index -i tune_noise_sla_ind/sla_ind_${i} -t LIPG_allele.0.$i.fa; done




#for i in $(seq 0.001 0.001 0.009); do
#    ~/Projects/salmon/build/src/salmon quant -i salmon_ind \
#    -la -1 polyester_sim/SRR5863327/out_${i}/sample_01_1.fasta \
#    -2 polyester_sim/SRR5863327/out_${i}/sample_01_2.fasta \
#    -o salmon_quant/salmon_out_${i} \
#    -z  salmon_quant/salmon_out_${i}/mapping.sam \
#    --rangeFactorization 4 ; done

for i in $(seq 0.001 0.001 0.009); do
    ~/Projects/salmon_sl/salmon/build/src/salmon quant -i sla_ind \
    -la -1 polyester_sim/SRR5863327/out_${i}/sample_01_1.fasta \
    -2 polyester_sim/SRR5863327/out_${i}/sample_01_2.fasta \
    -o sla_quant/sla_out_${i} \
    -z  sla_quant/sla_out_${i}/mapping.sam \
    --rangeFactorization 4 \
    --softFilter \
    --editDistance 4 ; done

#for i in {5..9}; do ~/Projects/salmon_sl/salmon/build/src/salmon quant -i tune_noise_sla_ind/sla_ind_${i} -la -1 tune_exp/simulation_70_1.fq -2 tune_exp/simulation_70_2.fq -o tune_noise_sla/sla_out_${i} -z tune_noise_sla/sla_out_${i}/mapping.sam --softFilter --editDistance 4 --rangeFactorization 4 --initUniform; done
