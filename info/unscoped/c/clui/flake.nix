{

  inputs.packument.url   = "https://registry.npmjs.org/clui?rev=63-7181339f21859667ea2b77b0eb64e846";
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
    ident = "clui";
    ldir  = "info/unscoped/c/clui";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
