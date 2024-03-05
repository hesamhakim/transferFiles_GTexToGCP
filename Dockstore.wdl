version 1.0
task bam_gc_uri {
    input {
        File drs_uri_bam
        String file_bam_name
        Int mem_gb
        Int addtional_disk_size = 100 
        Int machine_mem_size = 15
        Int disk_size 
 

    }

	command {
		bash -c "echo ~{drs_uri_bam}"
	}

	output {
		String BamGC = "echo ~{drs_uri_bam}"
	}

	runtime {
		docker: "quay.io/ldcabansay/samtools:latest"
		memory: mem_gb + "GB"
		disks: "local-disk " + disk_size + " HDD"
	}

	meta {
		author: "hesamhakim"
	}
}

workflow bam_gc_uri_Workflow {
    input {
        File drs_uri_bam
        String file_bam_name
        Int mem_gb
    }
	call bam_gc_uri { 
		input:
	 drs_uri_bam=drs_uri_bam,
	 file_bam_name=file_bam_name,
	 mem_gb=mem_gb 
	}
	output {
		String output_bam=bam_gc_uri.BamGC
	}
}

#		
