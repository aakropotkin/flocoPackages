{

  inputs.packument.url   = "https://registry.npmjs.org/css-what?rev=32-9dbdf1c428ab9e2bed0cebf88dc35944";
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
    ident = "css-what";
    ldir  = "info/unscoped/c/css-what";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
