{

  inputs.packument.url   = "https://registry.npmjs.org/swig?rev=224-362d7efb2669a4250c8a24bdfffa54b1";
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
    ident = "swig";
    ldir  = "info/unscoped/s/swig";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
