{

  inputs.packument.url   = "https://registry.npmjs.org/bourne?rev=33-c2ba5e61e6b698dae9dde827049a7eac";
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
    ident = "bourne";
    ldir  = "info/unscoped/b/bourne";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
