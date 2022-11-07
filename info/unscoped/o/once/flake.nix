{

  inputs.packument.url   = "https://registry.npmjs.org/once?rev=65-64ffd2aa845fbf822166db39a58f6eb6";
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
    ident = "once";
    ldir  = "info/unscoped/o/once";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
