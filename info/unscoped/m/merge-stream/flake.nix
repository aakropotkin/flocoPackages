{

  inputs.packument.url   = "https://registry.npmjs.org/merge-stream?rev=99-ee712bd71f1af4b022df717eebeab668";
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
    ident = "merge-stream";
    ldir  = "info/unscoped/m/merge-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
