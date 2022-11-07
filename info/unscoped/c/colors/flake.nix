{

  inputs.packument.url   = "https://registry.npmjs.org/colors?rev=614-1d245259c31a40ac32d7aecb6df8a235";
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
    ident = "colors";
    ldir  = "info/unscoped/c/colors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
