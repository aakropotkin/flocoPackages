{

  inputs.packument.url   = "https://registry.npmjs.org/css-functions-list?rev=4-20efb7ee41c6bf64aeb791ba297aeb81";
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
    ident = "css-functions-list";
    ldir  = "info/unscoped/c/css-functions-list";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
