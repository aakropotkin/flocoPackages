{

  inputs.packument.url   = "https://registry.npmjs.org/any-base?rev=7-162ae7ad4beed8474cc914c36a051409";
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
    ident = "any-base";
    ldir  = "info/unscoped/a/any-base";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
