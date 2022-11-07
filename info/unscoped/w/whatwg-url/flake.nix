{

  inputs.packument.url   = "https://registry.npmjs.org/whatwg-url?rev=77-5c740d8c4a76962aa9d700b9139f1e67";
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
    ident = "whatwg-url";
    ldir  = "info/unscoped/w/whatwg-url";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
