{

  inputs.packument.url   = "https://registry.npmjs.org/make-error-cause?rev=17-6132814fdd39bf14a610bd30511a0c09";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "make-error-cause";
    ldir  = "info/unscoped/m/make-error-cause";
    inherit packument fetchInfo;
  } // latest';

}
