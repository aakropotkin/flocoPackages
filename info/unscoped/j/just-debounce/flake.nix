{

  inputs.packument.url   = "https://registry.npmjs.org/just-debounce?rev=11-ebf4289612b73dc9d60636c15ce9eebd";
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
    ident = "just-debounce";
    ldir  = "info/unscoped/j/just-debounce";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
