{
    logdir: "logdir/sparc_bert",
    model_config: "configs/sparc/nl2code-bert.jsonnet",
    model_config_args: {
        data_path: 'cosql/',
        bs: 1,
        num_batch_accumulated: 4,
        bert_version: "bert/",
        summarize_header: "avg",
        use_column_type: false,
        max_steps: 91000,
        num_layers: 8,
        lr: 1e-3,
        bert_lr: 1e-5,
        att: 1,
        end_lr: 0,
        sc_link: true,
        cv_link: true,
        use_align_mat: true,
        use_align_loss: true,
        bert_token_type: true,
        decoder_hidden_size: 512,
        end_with_from: true, # equivalent to "SWGOIF" if true
        clause_order: null, # strings like "SWGOIF", it will be prioriotized over end_with_from 
    },

    eval_name: "sparc_bert_%s_%d" % [self.eval_use_heuristic, self.eval_beam_size],
    eval_output: "__LOGDIR__/ie_dirs",
    eval_beam_size: 1,
    eval_use_heuristic: true,
    eval_steps: [ 1000 * x + 100 for x in std.range(0, 1)] + [10000],
    eval_section: "val",
}