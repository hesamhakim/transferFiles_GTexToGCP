version 1.0
task copyBam {
    input {
        File drs_uri_bam
        String file_bam_name
        Int mem_gb
        Int addtional_disk_size = 100 
        Int machine_mem_size = 15
        Int disk_size 
 

    }

	command {
		bash -c "echo cp ~{drs_uri_bam} ~{file_bam_name}"
	}

	output {
		File totalBam = "~{file_bam_name}"
	}

	runtime {
		docker: "quay.io/ldcabansay/samtools:latest"
		memory: mem_gb + "GB"
		disks: "local-disk " + disk_size + " HDD"
	}

	meta {
		author: "jlanej"
	}
}

workflow copyBamWorkflow {
    input {
        File drs_uri_bam
        String file_bam_name
        Int mem_gb
    }
	call copyBam { 
		input:
	 drs_uri_bam=drs_uri_bam,
	 file_bam_name=file_bam_name,
	 mem_gb=mem_gb 
	}
	output {
		File output_bam=copyBam.totalBam
	}
}

#		
