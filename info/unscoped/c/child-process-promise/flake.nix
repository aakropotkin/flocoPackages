{

  inputs.packument.url   = "https://registry.npmjs.org/child-process-promise?rev=63-378b1fc2346d5198f17741b724c26211";
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
    ident = "child-process-promise";
    ldir  = "info/unscoped/c/child-process-promise";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
