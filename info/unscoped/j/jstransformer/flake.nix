{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jstransformer?_rev=25-4fb055c029ba129847419f62df4bfbde";
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
    ident = "jstransformer";
    ldir  = "info/unscoped/j/jstransformer";
    inherit packument fetchInfo;
  } // latest';

}
