seeds=( 1385 1386 1387 1388 1389)

for idx in "${!seeds[@]}"
do
    mkdir cl_results_$idx
    python cl_naive.py --config configs/fcn8s_pascal_cl.yml --model_path runs/redfcn8s_ipascal/reduced_fcn8s_ipascal_best_model.pkl --cl_log cl_results_$idx/1cl_naive.txt --niters 1 --seed ${seeds[idx]}
    python cl_naive.py --config configs/fcn8s_pascal_cl.yml --model_path runs/redfcn8s_ipascal/reduced_fcn8s_ipascal_best_model.pkl --cl_log cl_results_$idx/2cl_naive.txt --niters 10 --seed ${seeds[idx]}
    python cl_imprinting.py --config configs/fcn8s_pascal_cl.yml --model_path runs/redfcn8s_ipascal/reduced_fcn8s_ipascal_best_model.pkl --cl_log cl_results_$idx/3cl_imprinting.txt --alpha 0.05 --seed ${seeds[idx]}
    python cl_imprinting.py --config configs/fcn8s_pascal_cl.yml --model_path runs/redfcn8s_ipascal/reduced_fcn8s_ipascal_best_model.pkl --cl_log cl_results_$idx/4cl_imprinting.txt --alpha 0.02 --seed ${seeds[idx]}
    python cl_imprinting.py --config configs/fcn8s_pascal_cl.yml --model_path runs/redfcn8s_ipascal/reduced_fcn8s_ipascal_best_model.pkl --cl_log cl_results_$idx/5cl_imprinting.txt --alpha 0.01 --seed ${seeds[idx]}
done