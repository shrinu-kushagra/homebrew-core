class KubeOne < Formula
    desc "Kubernetes cluster management tool"
    homepage "https://kubeone.io/"
    url "https://github.com/kubermatic/kubeone/archive/refs/tags/v1.6.2.tar.gz"
    sha256 "17674e554b6545164077c2f52e0835a259a291336e859b925134f2957e31290f"
  
    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      (buildpath/"src/github.com/kubeone/kubeone").install Dir["*"]
      cd "src/github.com/kubeone/kubeone" do
        system "make", "static"
        bin.install "kubeone"
      end
    end
  
    test do
      system "#{bin}/kubeone", "--version"
    end
  end